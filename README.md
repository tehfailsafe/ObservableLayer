# ObservableLayer for Framer
Creates an observable object that can drive properties for a layer. This is handy for modifying one layer from aonther source that may not know the layer exsists. This keeps your code less coupled to each other and can help decrease bugs.

# Example
```
require "ObservableLayer"

Store = {}
Box = new Layer
  width: 100
  height: 100
 
# setup the layer to observe changes to the Store
Box.observe(Store, "boxProperties", true)

# Later we can acccess the Store object and change boxProperties and the Box layer will react.
Utils.delay 2, () -> Store.boxProperties.width = 500
```
