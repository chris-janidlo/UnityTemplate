Empty Unity 5.6 project, set up for easy usage with git.

Attempts to come with "batteries included;" a complete git setup with `lfs`, useful post-merge hooks, and a Unity project set up to work perfectly with git.

# Usage

**Method 1** (if you're me):

1. Make new remote repository with final project name
2. Clone this with `git clone https://github.com/crassSandwich/UnityTemplate.git <project-name>`
3. Run `init.sh <remote-url>`

**Method 2** (if you aren't me):

1. Fork this repo
2. Rename it
3. Clone it
4. Run `init.sh`
5. Done!

## Issues

Not tested on Windows.

This is only intended to be used once and by a single user, for e.g. initializing a game jam project. In the future I might add some easy way to onboard additional members, but that isn't planned.

Method 2 might be borked
