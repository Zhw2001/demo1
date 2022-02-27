const setCss = {}


setCss.tableHeadCell = 'background-color:#f1f3fa; color:rgba(0, 0, 0, 0.85); font-weight:600; text-align:center;'
setCss.tableCell = 'text-align:center; font-weight:300;'
setCss.clickHandler = function (evt) {
    console.log(evt)
    let target = evt.target;
    if(target.nodeName == "SPAN"){
        target = evt.target.parentNode;
    }
    target.blur();
}


export default setCss