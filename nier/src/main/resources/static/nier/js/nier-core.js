function onlyUrl(obj) {
    var srcValue = $(obj).val();
    var realValue = srcValue.replace(/[^a-zA-Z0-9_/]*/g, "")
    $(obj).val(realValue);
}