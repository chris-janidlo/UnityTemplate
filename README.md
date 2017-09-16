Empty Unity 5.6 project, set up for easy usage with git. Used to create a new project or join an existing project made with this template.

Attempts to come with "batteries included;" a complete git setup with `lfs`, useful post-merge hooks, and a Unity project set up to work perfectly with git.

# Usage

**Method 1** (new project):

1. Make new GitHub project, give it a name (we'll call that `<project-name>`)
2. `git clone https://github.com/crassSandwich/UnityTemplate.git <project-name>`
3. `cd <project-name>`
3. `./init.sh -n <remote-url>`, where `<remote-url>` is the URL for `<project-name>`
4. Done!

**Method 2** (onboarding extant project):

1. `git clone https://github.com/crassSandwich/UnityTemplate.git`
2. `cd UnityTemplate`
3. `./init.sh -j <other-project-url`, where `<other-project-url>` is an existing Unity project's GitHub project
    - `./init.sh` will prompt for a project name; this is what the other repo will be called when it's cloned (we'll call it `<given-project-name>`)
4. When `init.sh` is done, you will be inside an empty, non-existant `UnityTemplate` directory; the new project will be in `UnityTemplate/../<given-project-name>`. Therefore, `cd ../<given-project-name>` and you'll be done.

## Issues

Not tested on Windows.
