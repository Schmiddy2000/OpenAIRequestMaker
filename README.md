# OpenAIRequestMaker
Some code for Swift/Xcode that lets you make request to the OpenAI API and retrieve the OpenAIObject or simply the response (still Alpha version).

The code consists of
- an OpenAI class that features the functions to retrieve the OpenAIObject or simple the response. The retrieval of the OpenAIObject works for regular chat completions as well as using function_calls. Yet there is still some work to do that eases the calling of the suggested functions and parameter retrieval.
- An extension for Alamofire
- Structs that allow for the encoding of request and decoding of responses to adhere to the required structures.
- A very basic contentView to test if the code works.

## Dependencies:
Alamofire wich can be added via https://github.com/Alamofire/Alamofire
