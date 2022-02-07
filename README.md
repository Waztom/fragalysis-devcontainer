# <a name="SetupXChemCARforDevelopers"></a>**VSCode Development Container for Fragalysis**

#

Instructions for setting up Fragalysis in a VSCode development container,<br>

## <a name="Setting up Windows Subsystem for Linux"></a>Windows subsystem for linux

If you're using Windows, to install git-crypt, it's strongly advised that you install Windows Subsystem for Linux (WSL).
For seting up WSL2 - you can follow these instructions: https://www.digitalocean.com/community/tutorials/how-to-install-the-windows-subsystem-for-linux-2-on-microsoft-windows-10 and/or https://docs.microsoft.com/en-gb/windows/wsl/install-win10

## <a name="VisualStudioCode"></a>Visual Studio Code

these instructions are designed for Visual Studio Code which can be installed for free from: https://code.visualstudio.com/

## <a name="GitCryptKey"></a>Git-Crypt Key

Secrets required for running the Fragalysis development container are encrypted, to unencrypt and run you will need the key from the Fragalysis development software maintainer<br><br>

# <a name="RepositoryfromGitHub"></a>Clone the "xchem-car" repository from GitHub

If you do not have git installed, inside a terminal:

`sudo apt install git` <br>

In you home directory eg `/home/<username>`, clone the Fragalysis development container repo using:

`git clone https://github.com/Waztom/fragalysis-devcontainer.git` <br>

# <a name="Docker"></a>Docker

## <a name="InstallDocker"></a>Install Docker

First you'll need Docker Desktop (or the relevent Docker Engine on Linux) you can find the appropriate download at: https://www.docker.com/get-started and specifically for Ubuntu, instructions at: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

## <a name="InstallDockerCompose"></a>Install Docker Compose

if you're using a Linux machine, once Docker is installed also install docker compose, instructions are available at: https://docs.docker.com/compose/install/

for WSL (Windows), you do not need to install Docker compose

## <a name="InstallVSCodeExtention"></a>Install VS Code Extensions

Docker and Docker Compose should now be installed <br>
<em>(If on Windows/Mac, start docker desktop)</em><br>

Open Visual Studio Code<br>
to check docker is running correctly open the terminal and run:<br>

> `docker --version`<br>

you should get a response similar to:

> Docker version 18.09.2, build 6247962

In Visual Studio Code open the extensions panel (left-hand panel or using Ctrl+Shift+X ) and search for "<em>Remote - Containers</em>" and click **Install**.

Once installed a box with two arrows pointing in opposite directions should appear in the bottom left corner of Visual studio code
<br>
<br>

## <a name="InstallRemoteWSL"></a>Install Remote - WSL Extension

If you are running WSL - you need to install the Remote - WSL extension. Skip this step if you're running Ubuntu/Linux.

Ctrl + SHIFT + X and type in 'Remote - WSL' to install the extension.
See (https://code.visualstudio.com/blogs/2020/07/01/containers-wsl) for more information about using dev containers in WSL2

# <a name="gitcrypt"></a>git-crypt

git-crypt (https://github.com/AGWA/git-crypt) is used for encrypting secrets required to run CAR
you need the appropriate <em>crypt-key</em> file from the software maintainer.

If you are using a Windows machine then it is necessary to download the Windows Subsystem for Linux 2. A very good guide is found here: https://www.digitalocean.com/community/tutorials/how-to-install-the-windows-subsystem-for-linux-2-on-microsoft-windows-10

You will need to allow WSL integration with Docker Desktop. To do this go to settings on Docker > Resources > WSL Integration. Then enable WSL integration for your desired distribution.

Incorporation of VSCode with WSL for further information: https://code.visualstudio.com/docs/remote/wsl-tutorial

**Note: We have tested this using Ubuntu 18.04 and 20.04, compatibility of other Linux distributions have not been investigated.**

## <a name="InstallGitCrypt"></a>Install Git-Crypt

- if you are using Ubuntu or Debian, you can install git-crypt by:

> `sudo apt-get update` <br> 
> `sudo apt-get install git-crypt` <br>

## <a name="UnlockingSecrets"></a>Unlocking Secrets

- once Git-Crypt is installed unlock the secrets using:

> `cd fragalysis-devcontainer`<br> 
> `git-crypt unlock <'path to git-crypt crypt-key'>`<br>

# <a name="Clone frontend and backend repos"></a>Start system

- specify the fork you want to use here:

> `git clone https://github.com/Waztom/fragalysis-backend.git`<br>

> `git clone https://github.com/ag-m2ms/fragalysis-frontend.git`<br>

# <a name="Startsystem"></a>Start system

### <a name="Start VS Code"></a>Start VS Code (WSL)

> `code .` <br>

### <a name="Start VS Code"></a>Start VS Code (Ubuntu)

Open VS Code and go to File-> Open Folder and open the repository directory<br>

### <a name="StartRemoteContainer"></a>Start Remote Container

- start Visual Studio remote container with **Ctrl + Shift + P** and type **"Remote-containers: Open folder in container"** then click on that option. <br> ensure you have the repository folder [your file path/xchem-CAR] selected and choose **"Ok"**/**"Open"**
- Your container should start to build, click on the popup notification at the bottom right of visual studio to view the log/progress

### <a name="TimetoLaunch"></a>Time to Launch

- Open a new terminal that you can interact with. if the terminal is visible at the bottom of the screen click on the plus "create new integrated terminal" or use the keybord shortcut "**Ctrl+Shift+`**" button or use the adjacent "split terminal" (or "**Ctrl+Shift+5**") button to see the new terminal adjacent to the current terminal
- you should now be in the container running Debian Linux
- in the new terminal type (Terminal 1):

  > `cd .devcontainer` <br>

- if you are running the container for the first time, run:

  > `./launch-frontend.sh` <br>

- to run the backend migrations, run:

  > `./launch-backend.sh` <br>

- to run the server:
  > `./launch-server.sh` <br>
