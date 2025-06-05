extends Node

class_name YamlLoader

static func load_yaml(path: String) -> Array:
    var result: Array = []
    var file = FileAccess.open(path, FileAccess.READ)
    if file:
        var text = file.get_as_text()
        var parser = YAML.new()
        var err = parser.parse(text)
        if err == OK:
            result = parser.data
        else:
            push_error("Failed to parse YAML: %s" % path)
    return result
