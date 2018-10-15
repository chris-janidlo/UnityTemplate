Empty Unity 2018 project, set up for easy usage with git. Used to create a new project or join an existing project made with this template. Exclusively `bash` flavored until I'm forced to use a sterilized Windows box.

Requires [git lfs](https://git-lfs.github.com/).

# Usage

**Method 1** (new project):

1. Come up with a name for the project - we'll call that name `<project-name>`.
2. Create an empty git repository on your favorite hosting site and make a note of its URL - we'll call the URL `<remote-url>`.
3. `(name="<project-name>"  &&  url="<remote-url>"  &&  git clone https://github.com/crassSandwich/UnityTemplate.git "$name" && cd "$name" && ./init.sh -n "$url")`
4. Done! There is now a Unity project residing in a directory named `<project-name>`, and the git repository at `<remote-url>` is set up with an initial commit.

**Method 2** (onboarding existant project):

1. `git clone https://github.com/crassSandwich/UnityTemplate.git`
2. `cd UnityTemplate`
3. `./init.sh -j <other-project-url`, where `<other-project-url>` is an existing Unity project's GitHub project
    - `./init.sh` will prompt for a project name; this is what the other repo will be called when it's cloned (we'll call it `<given-project-name>`)
4. When `init.sh` is done, you will be inside an empty, non-existant `UnityTemplate` directory; the new project will be in `UnityTemplate/../<given-project-name>`. `init.sh` will tell you to `cd` to a directory; execute that command and you'll be finished.
