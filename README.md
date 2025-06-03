🚀 Windows Context Menu Customizer

This repository provides a versatile .reg file template, allowing you to easily add custom options to your Windows right-click context menus. Personalize your workflow by adding quick shortcuts to your favorite applications directly where you need them most: on the desktop, within folders, or for specific file types.
---
🌟 Features

    Right-Click on Desktop Background: Launch apps directly from your desktop.
    Right-Click on Folders: Open folders with specialized tools or initiate processes from a folder's context menu.
    Right-Click on All Files (*): A generic option for any file type (use sparingly to avoid clutter).
    Right-Click on Specific File Types: Define actions for images, text files, PDFs, audio, or any other file extension.
    Cascade Menus (Submenus): Group multiple related options under a single, organized submenu to keep your context menus tidy.
---
📝 How to Use

Follow these simple steps to customize your Windows context menus:

    Download: Get the context_menu_template.reg file from this repository.
    Open in Text Editor: Right-click on WindowsCustomContextMenu.reg and select "Edit" or open it with Notepad, VS Code, or any other plain text editor.
    Uncomment and Customize:
        The file is heavily commented with ;; at the start of each line to keep sections disabled by default.
        Find the sections you want to enable (e.g., "SECTION 1: RIGHT-CLICK ON DESKTOP BACKGROUND").
        Remove the two leading semicolons ;; from the lines you wish to activate.
        Replace YOUR_APPLICATION_NAME with the actual text you want to appear in your right-click menu (e.g., Open with VS Code, Run PowerShell Here).
        Replace C:\\Path\\To\\Your\\Application\\your_app.exe with the full, correct path to your application's executable.
            Important: Use double backslashes \\ for all directory separators.
            If your application path contains spaces (e.g., C:\Program Files\My App\app.exe), you must enclose the entire path in escaped double quotes, like this: \"C:\\Program Files\\My App\\app.exe\".
        %1 is a placeholder that passes the path of the selected file or folder to the application.
        %V is a placeholder that passes the path of the current folder when right-clicking on the background of a folder.
    Save Changes: Save the context_menu_template.reg file after making your edits.
    Merge into Registry: Double-click the modified WindowsCustomContextMenu.reg file.
        You will be prompted with a security warning asking if you want to allow the app to make changes to your device. Click "Yes."
        A second prompt will ask if you are sure you want to add the information to the registry. Click "Yes" again.
    Verify: Right-click on the relevant area (desktop, folder, or specific file type) to see your new custom context menu option.
---
🗑️ How to Uninstall / Remove Entries

This repository also includes a powerful batch script to help you easily create uninstaller .reg files for your custom entries.

    Locate the RegEdit_Uninstaller.bat file: This is the batch script you downloaded.
    Prepare Your Original .reg File: Ensure you have the original .reg file (e.g., WindowsCustomContextMenu.reg) that you used to add the entries. This script will parse that file to identify the keys to remove.
    Generate Uninstallers:
        Drag your original custom .reg file (e.g., WindowsCustomContextMenu.reg) directly onto the RegEdit_Uninstaller.bat script.
        A command prompt window will open, parse your file, and create individual uninstaller .reg files.
        These newly generated uninstaller files will be placed in a new folder named RegUninstallers
    Run an Uninstaller:
        Navigate to the RegUninstallers folder.
        Find the specific Uninstall_YOUR_KEY_PATH.reg file that corresponds to the entry you wish to remove (the filename will reflect the registry path).
        Double-click this uninstaller .reg file.
        Confirm the security prompts (click "Yes" twice) to remove the entry from your registry.

This process ensures you can selectively remove any custom context menu options you've added without manually navigating the Registry Editor.

    
---
⚠️ Important Considerations

    Backup Your Registry: Before making significant changes, it's always a good practice to back up your Windows Registry.
    Path Accuracy: Double-check your application paths and ensure proper use of double backslashes and escaped quotes. Incorrect paths will prevent the shortcuts from working.
    Clutter: Be mindful of adding too many generic entries (like HKEY_CLASSES_ROOT\*) as they can make your right-click menus overly long and difficult to navigate.
    SystemFileAssociations: For file type-specific entries, HKEY_CLASSES_ROOT\SystemFileAssociations\.extension\ is generally more robust than directly modifying HKEY_CLASSES_ROOT\.extension\. The image association covers many common image formats.


Note: This is open-source and free to use. If you find it helpful, consider starring the repository or sharing it with others!

---
Last updated on June 3rd, 2025
