using Godot;
using System.IO;

public partial class SaveSystem : Node
{
    private const string SavePath = "user://save.json";

    public void SaveGame(string json)
    {
        File.WriteAllText(SavePath, json);
    }

    public string LoadGame()
    {
        return File.Exists(SavePath) ? File.ReadAllText(SavePath) : string.Empty;
    }
}
