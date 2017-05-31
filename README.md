# ObservableLayer for Framer
Creates an observable object that can drive properties for a layer. This is handy for modifying one layer from aonther source that may not know the layer exsists. This keeps your code less coupled to each other and can help decrease bugs.

# Example
```
require "ObservableLayer"

# Optionally create a generic object to store names of properties we can modify
Store = {}

# Create a layer
Box = new Layer
  width: 100
  height: 100
 
# Setup the layer to observe changes to the Store
Box.observe(Store, "boxProperties", true)

# Later we can acccess the Store object and change boxProperties and the Box layer will react.
Utils.delay 2, () -> Store.boxProperties.width = 500

# It works with text properties as well
text = new TextLayer
text.observe Store, "textValue"
Store.textValue.text = "Updated from Store!"

```

### Layer.observe(context: Object, variableName: String, animated: Boolean = false)
