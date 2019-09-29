
var SERVER_DOMAIN = "http://127.0.0.1:8080"

function send(url, data, success, fial){
    // get id and key
    var id = 'identifier';  // TODO: grrr.
    // make the request
    _send(url, data, id, success, fial);
}


function _send(url, data, id, success, fial){
    // sign data
    data['id'] = id;
    data['timestamp'] = Date.now();
    data['signature'] = getSignature(data);
    // send request
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = (function() {
        if (xhr.readyState === XMLHttpRequest.DONE
                && xhr.status === 200) {
            success(xhr);
        } else if (xhr.readyState === XMLHttpRequest.DONE
                && xhr.status === 0){
            // No internet connection! (or server unavailable)
            // TODO: what to do once connection is restored? Retry?
            fial(xhr);
        } else if (xhr.readyState === XMLHttpRequest.DONE){
            fial(xhr);
        }
    })
    xhr.onerror = fial

    // prepare url
    if (url.indexOf("http") !== 0){
        url = SERVER_DOMAIN + url;
    }

    xhr.open('POST', url, true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.send(JSON.stringify(data));
}


function getSignature(data){
    return signer.getSignature(JSON.stringify(data));
}
