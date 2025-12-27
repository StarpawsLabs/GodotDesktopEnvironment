# Godot Virtual PC(In Building)

A lightweight module that integrates a virtual desktop environment into your Godot project. You can add text files or custom software that opens in its own window. Feel free to suggest features — I’m happy to add more interesting elements!

This project is built with Godot 4.5.1. If you encounter any compatibility issues, please let me know.

## Getting Started

1. Copy the `GodotVirtualPC` folder into your project’s `res://` directory. You can also open the provided demo to see if this module meets your game’s needs.

2. Create a `PCInfo` resource in your filesystem. Then, add `res://GodotVirtualPC/Prefabs/pc.tscn` to your scene, assign the `PCInfo` resource to it, and configure its settings.  
   You can customize the wallpaper, install software (configured with `SoftwareInfo`), or add text files (configured with `FileInfo`).

3. Design the window for your software. It must include a method called `init_software_window_node(open_argc: Array)`, which can be left empty for now, as the virtual PC system will handle its initialization.  
   Assign this scene to your `SoftwareInfo` when configuring.

   Why is `init_software_window_node(open_argc: Array)` needed?  
   Certain files require specific software to open them (e.g., a text file needs a text editor). When you configure a `FileInfo` resource, specify the default opener and ensure its window scene implements `init_software_window_node(open_argc: Array)`.

You’re now ready to run the scene and enjoy your own Godot-powered virtual PC!