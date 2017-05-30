Layer::getObserver = ({animated = false} = {}) ->
	proxy = new Proxy this,
		get: (target, prop, receiver) -> Reflect.get target, prop
		set: (target, prop, value, receiver) =>
			if prop != "__framerInstanceInfo"
				if animated
					obj = {}
					obj[prop] = value
					target.animate(obj)
				return Reflect.set(target, prop, value)
	return proxy

Layer::observe = (object, property, animated = false) ->
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

			return Reflect.set(target, prop, value)
