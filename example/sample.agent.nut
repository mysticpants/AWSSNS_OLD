#require "AWSRequestV4.class.nut:1.0.2"
#require "AWSSNS.class.nut:1.0.0"



// Enter your AWS information here
const AWS_SNS_TEST_REGION = "YOUR_REGION_HERE"
const AWS_SNS_ACCESS_KEY_ID = "YOUR_AWS_ACCESS_KEY_HERE";
const AWS_SNS_SECRET_ACCESS_KEY = "YOUR_AWS_SECRET_ACCESS_KEY_HERE";
const AWS_SNS_TOPIC_ARN = "YOUR_TOPIC_ARN_HERE";
// initialise the class
sns <- AWSSNS(AWS_SNS_TEST_REGION, AWS_SNS_ACCESS_KEY_ID, AWS_SNS_SECRET_ACCESS_KEY);


// parameters for specified functions
subscribeParams <- {
    "Protocol": "https",
    "TopicArn": AWS_SNS_TOPIC_ARN,
    "Endpoint": http.agenturl()
}

PublishParams <- {
    "TopicArn": AWS_SNS_TOPIC_ARN,
    "Message": "Hello World"
}


// Handle incoming HTTP requests which are sent in response to subscription to confirm said subscription
http.onrequest(function(request, response) {

    try {

        local requestBody = http.jsondecode(request.body);

        // Handle an SES SubscriptionConfirmation request
        if ("Type" in requestBody && requestBody.Type == "SubscriptionConfirmation") {
            server.log("Received HTTP Request: AWS_SNS SubscriptionConfirmation");
            local confirmParams = {
                    "Token": requestBody.Token,
                    "TopicArn": requestBody.TopicArn
                }
                // confirm the subscription
            sns.ConfirmSubscription(confirmParams, function(res) {

                server.log("Confirmation Response: " + res.statuscode);
                if (res.statuscode == 200) {
                    // now that the subscription is established publish a message
                    sns.Publish(PublishParams, function(res) {

                        server.log(" Publish Confirmation XML Response: " + res.body);
                    });
                }
            });
        }

        response.send(200, "OK");

    } catch (exception) {
        server.log("Error handling HTTP request: " + exception);
        response.send(500, "Internal Server Error: " + exception);
    }

})

// Subscribe to a topic
sns.Subscribe(subscribeParams, function(res) {
    server.log("Subscribe Response: " + res.statuscode);
});
