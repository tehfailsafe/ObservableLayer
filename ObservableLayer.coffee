__observers = {} # { propertyName: callBackFunction }

Store = new Proxy {},
	set: (target, prop, value, receiver) ->
		__observers[prop]?(value)
		return Reflect.set(target, prop, value)

Layer::onUpdate = (property, callback) ->
	__observers[property] = callback.bind(this)

Layer::observe = (object, property, animated = false, callback) ->
	observableObject = object[property] || object[property] = {}
	object[property] = new Proxy observableObject,
		get: (target, prop, receiver) -> Reflect.get target, prop
		set: (target, prop, value, receiver) =>
			if animated
				obj = {}
				obj[prop] = value
				this.animate(obj)
			else
				this[prop] = value

			callback?(value)
			return Reflect.set(target, prop, value)



exports.Store = Store
