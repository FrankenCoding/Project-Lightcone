using Godot;
using System.IO.Compression;
using System.Text;

public partial class SaveSystem : Node
{
    public void Save(string path, string json)
    {
        var compressed = Compress(json);
        System.IO.File.WriteAllBytes(path, compressed);
    }

    public string Load(string path)
    {
        if (!System.IO.File.Exists(path))
            return "";
        var compressed = System.IO.File.ReadAllBytes(path);
        return Decompress(compressed);
    }

    private byte[] Compress(string input)
    {
        var bytes = Encoding.UTF8.GetBytes(input);
        using (var output = new System.IO.MemoryStream())
        {
            using (var gzip = new GZipStream(output, CompressionLevel.Optimal))
            {
                gzip.Write(bytes, 0, bytes.Length);
            }
            return output.ToArray();
        }
    }

    private string Decompress(byte[] input)
    {
        using (var inputStream = new System.IO.MemoryStream(input))
        using (var gzip = new GZipStream(inputStream, CompressionMode.Decompress))
        using (var reader = new System.IO.StreamReader(gzip))
        {
            return reader.ReadToEnd();
        }
    }
}
