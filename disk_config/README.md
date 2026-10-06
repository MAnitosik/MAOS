# Disk image build configuration

These TOML files are passed to `bootc-image-builder` (bib) as `/config.toml` by the
`Build disk images` workflow (`.github/workflows/build-disk.yml`). They only configure
**image customizations** (`customizations.filesystem`, `customizations.installer.*`, ...).

## Root filesystem type — do not set it here

The MAOS image does not declare a default (bootable) root filesystem type, so bib has to be
told which one to create. Otherwise manifest generation fails with:

```
error: cannot build manifest: no default root filesystem type specified in container,
please use "--rootfs" to set manually
```

`rootfs` is **not** a valid key in these config files: bib decodes them into an osbuild
blueprint and rejects anything unknown, so adding `rootfs = "ext4"` here fails even earlier:

```
error: cannot build manifest: cannot read config: cannot decode "/config.toml":
unknown keys found: [rootfs]
```

Instead, the value lives in the workflow and is forwarded to bib as the `--rootfs` command
line option through the action's dedicated `rootfs` input:

```yaml
env:
  DISK_ROOTFS: "ext4"   # change to "xfs" or "btrfs" if preferred
...
- uses: osbuild/bootc-image-builder-action@...
  with:
    rootfs: ${{ env.DISK_ROOTFS }}
```

## Files

| File             | Used for disk types          |
| ---------------- | ---------------------------- |
| `disk.toml`      | `qcow2` (and other disk types)|
| `iso.toml`       | `anaconda-iso`               |
| `iso-gnome.toml` | anaconda ISO variant (minimal installer modules) |
| `iso-kde.toml`   | anaconda ISO variant (full installer modules)    |
