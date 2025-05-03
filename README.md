# Sysmon - System Resource Monitor

Sysmon is a lightweight, zero-dependency system resource monitor. It provides a clean, styled output of key system stats directly in your terminal, without the need for installation or flags. It works on Linux, macOS, and Windows with minimal setup!

## Preview

<p align="center">
  <img src="https://github.com/user-attachments/assets/d71b1f49-dd7a-45d8-81e4-110796926a0e" />
</p>


---

## 🔧 Features
- Single-command launch
- Works out-of-the-box on Linux, macOS, and Windows (via Git Bash, WSL, or PowerShell)
- No external tools or libraries required
- Displays the following information:
  - Hostname
  - Logged-in user
  - Uptime
  - Operating System (OS)
  - CPU load
  - Memory usage
  - Disk usage
  - CPU temperature (if available)

---

## 🚀 Usage

### For Linux/macOS (using `monitor.sh`):
Execute this:
```
   chmod +x monitor.sh
   ./monitor.sh
```


### For Windows (using PowerShell, `sysmon.ps1`):
1. Open PowerShell and navigate to the directory containing `sysmon.ps1`.
3. If you are running the script for the first time, you might need to allow script execution. Run the following command in PowerShell to enable script execution:
```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```
5. Run the script:
```
.\sysmon.ps1
```
5. If script fails to execute:
Files downloaded from the internet sometimes need to be unblocked
```
Unblock-File -Path .\sysmon.ps1
```


### Author
- Madhavan S  
- GitHub: [@witherking946](https://github.com/witherking946)
