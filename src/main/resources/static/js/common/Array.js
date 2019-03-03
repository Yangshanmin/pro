Array.prototype.contains = function(obj) {
	for (var i = 0; i < this.length; i++) {
		if (this[i] == obj)
			return true;
	}
	return false;
}
Array.prototype.indexOf = function(val) {
	for (var i = 0; i < this.length; i++) {
		if (this[i] == val)
			return i;
	}
	return -1;
};
Array.prototype.lastIndexOf = function(val) {
	for (var i = this.length-1;i >= 0; i--) {
		if (this[i] == val)
			return i;
	}
	return -1;
};
Array.prototype.remove = function(val) {
	var index = this.indexOf(val);
	if (index > -1) {
		this.splice(index, 1);
	}
};