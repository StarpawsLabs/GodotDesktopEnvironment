# Godot Virtual PC (Development Build)

A lightweight virtual desktop environment module for Godot 4 projects. This plugin enables you to embed a customizable PC interface within your game or application, complete with desktop icons, openable files, and launchable software windows.

**Version:** Development Build  
**Compatible Engine:** Godot 4.5.1  
**Status:** Actively in development — feature suggestions and bug reports are welcome!

---

##  Installation & Setup

### 1. Add the Virtual PC to Your Scene
- Locate the prefab at: `res://GodotVirtualPC/Prefabs/pc.tscn`
- Drag and drop `pc.tscn` into your scene.
- Create a new **Resource** of type `PCInfo` (e.g., `my_pc_info.tres`).
- Assign this resource to the **PC Info** property of the placed PC node.

### 2. Populate the Desktop
- Edit your `PCInfo` resource.
- Add entries to the **Desktop Items** array, each being either:
  - A `FileInfo` resource (for documents only)
  - A `SoftwareInfo` resource (for applications)

### 3. Configure Software (`SoftwareInfo`)
- **Type:** Choose between `Window` (opens in a window) or `Background` (runs without a window).
- **Window Content:** For window-type software, design a Control-based scene and attach a script that extends `WindowBase`.
- **Logic Script:** Create a script that extends `SoftwareScriptBase` and assign it to the **Software Script** property. This defines the software’s behavior.

### 4. Configure Files (`FileInfo`)
- Set the **File Name** (displayed on desktop) and **File Data** (custom data your software can read).
- **Important:** Assign a `SoftwareInfo` resource to **Default Opener**. This determines which application launches when the file is double-clicked.

---

##  Quick Start Example

1. Add `pc.tscn` to your scene.
2. Create a `PCInfo` resource and assign it.
3. Create a `SoftwareInfo` for a “Text Editor” app.
4. Create a `FileInfo` for “Readme.txt” and set its opener to the Text Editor.
5. Run the scene — you’ll see the file on the desktop. Click it to open in your Text Editor.

---

##  Development Notes

- Built and tested with **Godot 4.5.1**. Compatibility with other 4.x versions is intended but not guaranteed.
- The system is designed to be extensible — you can create custom software and file types by extending the provided base classes.
- All desktop items are previewed directly in the editor for easy layout.

---

##  Requesting Features

This module is under active development. If you have ideas for new features, improvements, or encounter any issues, please feel free to:
- Open an issue on the repository
- Suggest via email/direct message
- Submit a pull request

---

Enjoy creating your own virtual desktop inside Godot! 