// MIT License
//
// Copyright 2017 Electric Imp
//
// SPDX-License-Identifier: MIT
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
// OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.


class AWSSNS {

    static VERSION = "1.0.0";

    static SERVICE = "sns";
    static TARGET_PREFIX = "SNS_20100331";

    _awsRequest = null;
    //==========================================================================
    // @param {string} region
    // @param {string} accessKeyId
    // @param {string} secretAccessKey
    //==========================================================================
    constructor(region, accessKeyId, secretAccessKey) {
        if ("AWSRequestV4" in getroottable()) {
            _awsRequest = AWSRequestV4(SERVICE, region, accessKeyId, secretAccessKey);
        } else {
            throw ("This class requires AWSRequestV4 - please make sure it is loaded.");
        }
    }

    //==========================================================================
    // @param {table} params
    // @param {function} cb
    //==========================================================================
    function ConfirmSubscription(params, cb) {
        local headers = { "Content-Type": "application/x-www-form-urlencoded" };

        local body = {
            "Action": "ConfirmSubscription",
            "Version": "2010-03-31"
        };

        foreach (k,v in params) {
            body[k] <- v;
        }

        _awsRequest.post("/", headers, http.urlencode(body), cb);
    }

    //==========================================================================
    // @param {table} params
    // @param {function} cb
    //==========================================================================
    function ListSubscriptions(params, cb) {
        local headers = { "Content-Type": "application/x-www-form-urlencoded" };

        local body = {
            "Action": "ListSubscriptions",
            "Version": "2010-03-31"
        };

        foreach (k,v in params) {
            body[k] <- v;
        }

        _awsRequest.post("/", headers, http.urlencode(body), cb);
    }

    //==========================================================================
    // @param {table} params
    // @param {function} cb
    //==========================================================================
    function ListSubscriptionsByTopic(params, cb) {
        local headers = { "Content-Type": "application/x-www-form-urlencoded" };

        local body = {
            "Action": "ListSubscriptionsByTopic",
            "Version": "2010-03-31"
        };

        foreach (k,v in params) {
            body[k] <- v;
        }

        _awsRequest.post("/", headers, http.urlencode(body), cb);
    }

    //==========================================================================
    // @param {table} params
    // @param {function} cb
    //==========================================================================
    function ListTopics(params, cb) {
        local headers = { "Content-Type": "application/x-www-form-urlencoded" };

        local body = {
            "Action": "ListTopics",
            "Version": "2010-03-31"
        };

        foreach (k,v in params) {
            body[k] <- v;
        }

        _awsRequest.post("/", headers, http.urlencode(body), cb);
    }

    //==========================================================================
    // @param {table} params
    // @param {function} cb
    //==========================================================================
    function Publish(params, cb) {
        local headers = { "Content-Type": "application/x-www-form-urlencoded" };

        local body = {
            "Action": "Publish",
            "Version": "2010-03-31"
        };

        foreach (k,v in params) {
            body[k] <- v;
        }

        _awsRequest.post("/", headers, http.urlencode(body), cb);
    }

    //==========================================================================
    // @param {table} params
    // @param {function} cb
    //==========================================================================
    function Subscribe(params, cb) {
        local headers = { "Content-Type": "application/x-www-form-urlencoded" };

        local body = {
            "Action": "Subscribe",
            "Version": "2010-03-31"
        };

        foreach (k,v in params) {
            body[k] <- v;
        }

        _awsRequest.post("/", headers, http.urlencode(body), cb);
    }

    //==========================================================================
    // @param {table} params
    // @param {function} cb
    //==========================================================================
    function Unsubscribe(params, cb) {
        local headers = { "Content-Type": "application/x-www-form-urlencoded" };

        local body = {
            "Action": "Unsubscribe",
            "Version": "2010-03-31"
        };

        foreach (k,v in params) {
            body[k] <- v;
        }

        _awsRequest.post("/", headers, http.urlencode(body), cb);
    }

}
