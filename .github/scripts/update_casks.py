import json
import re
import subprocess
from pathlib import Path


def update_cask(repo, archive):
    release = json.loads(subprocess.check_output(
        ["gh", "api", f"repos/viko16/{repo}/releases/latest"], text=True
    ))
    tag = release["tag_name"]
    if not re.fullmatch(r"v\d+\.\d+\.\d+", tag, flags=re.ASCII):
        raise ValueError(f"{repo}: unexpected release tag {tag!r}")
    filename = archive.format(tag=tag)
    asset, = [item for item in release["assets"] if item["name"] == filename]
    digest = asset.get("digest") or ""
    if not re.fullmatch(r"sha256:[0-9a-f]{64}", digest):
        raise ValueError(f"{repo}: missing SHA256 for {filename}")

    path = Path("Casks") / f"{repo}.rb"
    source = path.read_text()
    pattern = r'^  version "([^"]+)"\n  sha256 "([0-9a-f]{64})"$'
    current = re.search(pattern, source, flags=re.MULTILINE)
    if not current:
        raise ValueError(f"{repo}: expected version and checksum in {path}")
    version = tag[1:]
    checksum = digest.removeprefix("sha256:")
    if current[1] == version and current[2] != checksum:
        raise ValueError(f"{repo}: checksum changed for existing release {tag}")
    if tuple(map(int, version.split("."))) < tuple(map(int, current[1].split("."))):
        raise ValueError(f"{repo}: latest release {tag} would downgrade {current[1]}")
    if current[1] != version:
        replacement = f'  version "{version}"\n  sha256 "{checksum}"'
        path.write_text(source[:current.start()] + replacement + source[current.end():])
    print(f"{repo}: {tag}")


update_cask("agent-webkit", "AgentWebKit-{tag}-macos-arm64.zip")
update_cask("whistle-menubar", "whistle-menubar-{tag}-macos-ARM64.zip")
