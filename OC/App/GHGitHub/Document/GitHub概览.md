# GitHub概览


### 当前版本

默认情况下，所有请求都`https://api.github.com`接收REST API 的v3 版本。我们建议您通过Accept标题明确请求此版本。

```
Accept: application/vnd.github.v3+json
```

有关GitHub的GraphQL API v4的信息，请参阅v4文档。有关迁移到GraphQL的信息，请参阅“ 从REST迁移 ”。

### 架构
所有API访问均通过HTTPS进行访问`https://api.github.com`。所有数据都以JSON的形式发送和接收。

```
curl -i https://api.github.com/users/octocat/orgs 
HTTP / 1.1 200 OK 
服务器：nginx 
日期：星期五，2012年10月12日23:33:14 GMT 
内容类型：application / json; charset = utf-8 
连接：keep-alive 
状态：200 OK 
ETag：“a00049ba79152d03380c34652f2cb612” 
X-GitHub-Media-Type：github.v3 
X-RateLimit-Limit：5000 
X-RateLimit-Remaining：4987 
X-RateLimit-Reset： 1350085394 
内容长度：5 
缓存控制：max-age = 0，私有，必须重新验证
X-Content-Type-Options：nosniff
```
包含空白字段`null`而不是省略。

所有时间戳均以ISO 8601格式返回：

```
YYYY-MM-DDTHH:MM:SSZ
```

### 摘要陈述
获取资源列表时，响应包括该资源的属性子集。这是资源的“摘要”表示。（API提供的某些属性在计算上是昂贵的。出于性能原因，摘要表示会排除这些属性。要获取这些属性，请获取“详细”表示。）

示例：获取存储库列表后，您将获得每个存储库的摘要表示。在这里，我们获取octokit组织拥有的存储库列表：

```
GET /orgs/octokit/repos
```

### 详细的陈述

获取单个资源时，响应通常包括 该资源的所有属性。这是资源的“详细”表示。（请注意，授权有时会影响表示中包含的详细信息量。）

示例：获取单个存储库后，您将获得存储库的详细表示。在这里，我们获取 octokit / octokit.rb存储库：

```
GET /repos/octokit/octokit.rb
```
该文档提供了每种API方法的示例响应。示例响应说明了该方法返回的所有属性。

### 认证
有三种方法可以通过GitHub API v3进行身份验证。需要身份验证的请求将返回404 Not Found，而不是 403 Forbidden在某些地方。这是为了防止私有存储库意外泄露给未经授权的用户。

### 基本认证
```
curl -u“username”https://api.github.com
```

### OAuth2令牌（在标头中发送）
```
curl -H“授权：令牌OAUTH-TOKEN ”https://api.github.com
```
### OAuth2令牌（作为参数发送）
```
卷曲https://api.github.com/?access_token= OAUTH-TOKEN
```
了解有关OAuth2的更多信息。请注意，对于非网站的应用程序，可以以编程方式获取 OAuth2令牌。

### OAuth2密钥/秘密
```
卷曲'https://api.github.com/users/whatever?client_id=xxxx&client_secret=yyyy'
```

这应该仅用于服务器到服务器方案。不要将OAuth应用程序的客户端密钥泄露给您的用户。

阅读有关未经身份验证的速率限制的更多信息。

### 登录限制失败
使用无效凭据进行身份验证将返回401 Unauthorized：

```
curl -i https://api.github.com -u foo：bar 
HTTP / 1.1 401 Unauthorized 
{ 
  “message”：“bad credentials”，
  “documentation_url”：“https://developer.github.com/v3” 
}

````

在短时间内检测到具有无效凭据的多个请求后，API将暂时拒绝该用户的所有身份验证尝试（包括具有有效凭据的身份验证）403 Forbidden：
```
curl -i https://api.github.com -u valid_username：valid_password 
HTTP / 1.1 403 Forbidden 
{ 
  “message”：“超出最大登录尝试次数。请稍后再试。”，
  “documentation_url”：“https：/ /developer.github.com/v3“ 
}
```

### 参数
许多API方法都采用可选参数。对于GET请求，未在路径中指定为段的任何参数都可以作为HTTP查询字符串参数传递：
```
curl -i“https://api.github.com/repos/vmg/redcarpet/issues?state=closed”
```
在此示例中，为查询字符串中传递的路径中的参数:owner 和:repo参数提供了“vmg”和“redcarpet”值:state。

为POST，PATCH，PUT，和DELETE的要求，不包含在URL参数应当被编码为JSON与“应用/ JSON”的内容类型：
```
curl -i -u username -d'{“scopes”：[“public_repo”]}'https://api.github.com/authorizations
```

###根端点
您可以GET向根端点发出请求以获取REST API v3支持的所有端点类别：

卷曲https://api.github.com
GraphQL全局节点ID
有关如何通过REST API v3 查找s并在GraphQL操作中使用它们的详细信息，请参阅“ 使用全局节点ID ” 指南node_id。

客户错误
接收请求主体的API调用有三种可能的客户端错误类型：

发送无效的JSON将导致400 Bad Request响应。

HTTP/1.1 400 Bad Request
Content-Length: 35

{"message":"Problems parsing JSON"}
发送错误类型的JSON值将导致400 Bad Request响应。

HTTP/1.1 400 Bad Request
Content-Length: 40

{"message":"Body should be a JSON object"}
发送无效字段将导致422 Unprocessable Entity 响应。

HTTP/1.1 422 Unprocessable Entity
Content-Length: 149

{
  "message": "Validation Failed",
  "errors": [
    {
      "resource": "Issue",
      "field": "title",
      "code": "missing_field"
    }
  ]
}
所有错误对象都具有资源和字段属性，以便客户端可以知道问题所在。还有一个错误代码，让您知道该字段有什么问题。这些是可能的验证错误代码：

错误名称	描述
missing	这意味着资源不存在。
missing_field	这意味着尚未设置资源上的必填字段。
invalid	这意味着字段的格式无效。该资源的文档应该能够为您提供更具体的信息。
already_exists	这意味着另一个资源与此字段具有相同的值。这可能发生在必须具有某些唯一键（例如Label名称）的资源中。
资源还可以发送自定义的验证错误（如果code是custom）。自定义错误将始终包含message描述错误的字段，并且大多数错误还将包含documentation_url指向某些内容的字段，这些字段可能有助于您解决错误。

HTTP重定向
API v3在适当的地方使用HTTP重定向。客户端应该假定任何请求都可能导致重定向。接收HTTP重定向不是错误，客户端应遵循该重定向。重定向响应将具有 Location标头字段，其中包含客户端应重复请求的资源的URI。

状态代码	描述
301	永久重定向。您用于发出请求的URI已被Location标头字段中指定的URI取代。此资源以及将来对此资源的所有请求都应定向到新URI。
302， 307	临时重定向。请求应逐字重复到Location标头字段中指定的URI，但客户端应继续使用原始URI以用于将来的请求。
可以根据HTTP 1.1规范使用其他重定向状态代码。

HTTP动词
在可能的情况下，API v3会努力为每个操作使用适当的HTTP谓词。

动词	描述
HEAD	可以针对任何资源发出以获取HTTP标头信息。
GET	用于检索资源。
POST	用于创建资源。
PATCH	用于使用部分JSON数据更新资源。举例来说，一个问题有资源title和body属性。PATCH请求可以接受一个或多个属性来更新资源。PATCH是一个相对较新且不常见的HTTP动词，因此资源端点也接受POST请求。
PUT	用于替换资源或集合。对于PUT没有body属性的请求，请务必将Content-Length标头设置为零。
DELETE	用于删除资源。
超媒体
所有资源可能具有*_url链接到其他资源的一个或多个属性。这些用于提供显式URL，以便正确的API客户端不需要自己构建URL。强烈建议API客户端使用这些。这样做将使开发人员更容易将来升级API。所有URL都应该是适当的RFC 6570 URI模板。

然后，您可以使用uri_template gem之类的东西来扩展这些模板：

>> tmpl = URITemplate.new('/notifications{?since,all,participating}')
>> tmpl.expand
=> "/notifications"

>> tmpl.expand :all => 1
=> "/notifications?all=1"

>> tmpl.expand :all => 1, :participating => 1
=> "/notifications?all=1&participating=1"
分页
默认情况下，返回多个项目的请求将分页为30个项目。您可以使用?page参数指定更多页面。对于某些资源，您还可以使用?per_page参数将自定义页面大小设置为100 。请注意，由于技术原因，并非所有端点都遵循该?per_page参数，请参阅事件。

卷曲'https://api.github.com/user/repos?page=2&per_page=100'
请注意，页码编号是从1开始的，省略?page 参数将返回第一页。

有关分页的更多信息，请查看我们的分页遍历指南。

链接标题
注意：使用链接头值形成调用而不是构建自己的URL非常重要。

该链接头包括分页信息：

Link: <https://api.github.com/user/repos?page=3&per_page=100>; rel="next",
  <https://api.github.com/user/repos?page=50&per_page=100>; rel="last"
该示例包括换行符以提高可读性。

此Link响应标头包含一个或多个超媒体链接关系，其中一些可能需要扩展为URI模板。

可能的rel值是：

名称	描述
next	紧接着的下一页结果的链接关系。
last	最后一页结果的链接关系。
first	第一页结果的链接关系。
prev	前一页结果的链接关系。
限速
对于使用基本身份验证或OAuth的API请求，您每小时最多可以处理5000个请求。无论是否使用了基本身份验证或OAuth令牌，经过身份验证的请求都与经过身份验证的用户相关联 。这意味着，当用户使用同一用户拥有的不同令牌进行身份验证时，用户授权的所有OAuth应用程序每小时共享相同的5000个请求配额。

对于未经身份验证的请求，速率限制允许每小时最多60个请求。未经身份验证的请求与原始IP地址相关联，而不是与发出请求的用户相关联。

请注意，Search API具有自定义速率限制规则。

任何API请求的返回HTTP标头都会显示您当前的速率限制状态：

curl -i https://api.github.com/users/octocat 
HTTP / 1.1 200 OK 
日期：星期一，01七月2013 17:27:06 GMT 
状态：200 OK 
X-RateLimit-Limit：60 
X-RateLimit-Remaining ：56 
X-RateLimit-Reset：1372700873
标题名称	描述
X-RateLimit-Limit	您每小时允许的最大请求数。
X-RateLimit-Remaining	当前速率限制窗口中剩余的请求数。
X-RateLimit-Reset	当前速率限制窗口以UTC纪元秒重置的时间。
如果您需要不同格式的时间，任何现代编程语言都可以完成工作。例如，如果在Web浏览器上打开控制台，则可以轻松地将重置时间作为JavaScript Date对象。

new Date(1372700873 * 1000)
// => Mon Jul 01 2013 13:47:53 GMT-0400 (EDT)
如果超出速率限制，则会返回错误响应：

HTTP / 1.1 403禁止
日期：2013年8月20日星期二14:50:41 GMT 
状态：403禁止
X-RateLimit-Limit：60 
X-RateLimit-Remaining：0 
X-RateLimit-Reset：1377013266 
{ 
   “message”：“API超出xxx.xxx.xxx.xxx的速率限制。（但这里有个好消息：经过身份验证的请求获得更高的速率限制。请查看文档以获取更多详细信息。）“，
   ”documentation_url“：”https：//developer.github .com / v3 /＃rate-limiting“ 
}
您可以检查您的费率限制状态，而不会产生API命中。

增加OAuth应用程序的未经身份验证的速率限制
如果您的OAuth应用程序需要以更高的速率限制进行未经身份验证的调用，则可以将应用程序的客户端ID和机密作为查询字符串的一部分传递。

curl 
-i'https ：//api.github.com/users/whatever?client_id=xxxx&client_secret=yyyy'HTTP /1.1 200 OK 
日期：星期一，01七月2013 17:27:06 GMT 
状态：200 OK 
X-RateLimit-限制：5000 
X-RateLimit-Remaining：4966 
X-RateLimit-Reset：1372700873
注意：切勿与任何人共享您的客户端密码或将其包含在客户端浏览器代码中。此处显示的方法仅用于服务器到服务器的调用。

保持在速率限制内
如果您使用基本身份验证或OAuth超出了速率限制，则可以通过缓存API响应和使用条件请求来解决问题。

滥用率限制
为了在GitHub上提供优质服务，在使用API​​时，某些操作可能会适用额外的速率限制。例如，使用API​​来快速创建内容，积极地轮询而不是使用webhook，进行多个并发请求，或者重复请求计算量大的数据可能导致滥用率限制。

滥用率限制并非旨在干扰API的合法使用。您的正常费率限制应该是您定位的唯一限制。为确保您成为优秀的API公民，请查看我们的最佳实践指南。

如果您的应用程序触发此速率限制，您将收到一条信息性响应：

HTTP / 1.1 403 Forbidden 
Content-Type：application / json; charset = utf-8 
连接：关闭
{ 
  “message”：“您已触发滥用检测机制，并暂时阻止内容创建。请稍后再次重试您的请求。”，
  “documentation_url”：“https：//开发人员。 github.com/v3/#abuse-rate-limits“ 
}
需要用户代理
所有API请求必须包含有效的User-Agent标头。没有User-Agent 标题的请求将被拒绝。我们要求您使用GitHub用户名或应用程序名称作为User-Agent标头值。如果有问题，我们可以与您联系。

这是一个例子：

用户代理：Awesome-Octocat-App
cURL User-Agent默认发送有效标头。如果您User-Agent通过cURL（或通过替代客户端）提供无效标头，您将收到403 Forbidden回复：

curl -iH'用户代理：'https://api.github.com/meta 
HTTP / 1.0 403禁止
连接：关闭
内容类型：text / html 
管理规则禁止请求。
请确保您的请求具有User-Agent标头。
检查https://developer.github.com以了解其他可能的原因。
有条件的请求
大多数响应返回ETag标题。许多回复也会返回Last-Modified标题。您可以使用这些标头的值分别使用If-None-Match和If-Modified-Since标头对这些资源发出后续请求 。如果资源未更改，服务器将返回a 304 Not Modified。

注意：发出条件请求并收到304响应不会计入您的速率限制，因此我们建议您尽可能使用它。

curl -i https://api.github.com/user 
HTTP / 1.1 200 OK 
Cache-Control：private，max-age = 60 
ETag：“644b5b0155e6404a9cc4bd9d8b1ae730” 
Last-Modified：Thu，05 Jul 2012 15:31:30 GMT 
状态：200 OK 
变化：接受，授权，Cookie 
X-RateLimit-Limit：5000 
X-RateLimit-Remaining：4996 
X-RateLimit-Reset：1372700873 
curl -i https://api.github.com/user 
-H'if -None-Match：“644b5b0155e6404a9cc4bd9d8b1ae730”' HTTP / 1.1 304未修改
Cache-Control：private，max-age = 60 
ETag：“644b5b0155e6404a9cc4bd9d8b1ae730” 
Last-Modified：Thu，05 Jul 2012 15:31:30 GMT 
状态：304 Not修改了
变化：接受，授权，Cookie 
X-RateLimit-Limit：5000
X-RateLimit-Remaining：4996 
X-RateLimit-Reset：1372700873 
curl -i https://api.github.com/user -H“If-Modified-Since：Thu，05 Jul 2012 15:31:30 GMT” 
HTTP /1.1 304未修改
Cache-Control：private，max-age = 60 
Last-Modified：Thu，05 Jul 2012 15:31:30 GMT 
状态：304未修改
变化：接受，授权，Cookie 
X-RateLimit-Limit：5000 
X-RateLimit-Remaining：4996 
X-RateLimit-Reset：1372700873
跨源资源共享
API支持来自任何来源的AJAX请求的跨源资源共享（CORS）。您可以阅读“ CORS W3C建议书 ”或 “HTML 5安全指南”中的此介绍。

以下是从浏览器发送的示例请求 http://example.com：

curl -i https://api.github.com -H“来源：http：//example.com”
找到HTTP / 1.1 302
Access-Control-Allow-Origin：*
访问控制 - 暴露 - 标题：ETag，Link，X-GitHub-OTP，X-RateLimit-Limit，X-RateLimit-Remaining，X-RateLimit-Reset，X-OAuth-Scopes，X-Accepted-OAuth-Scopes， X-轮询间隔
这就是CORS预检请求的样子：

curl -i https://api.github.com -H“Origin：http：//example.com”-X OPTIONS
HTTP / 1.1 204无内容
Access-Control-Allow-Origin：*
Access-Control-Allow-Headers：授权，内容类型，If-Match，If-Modified-Since，If-None-Match，If-Unmodified-Since，X-GitHub-OTP，X-Requested-With
Access-Control-Allow-Methods：GET，POST，PATCH，PUT，DELETE
访问控制 - 暴露 - 标题：ETag，Link，X-GitHub-OTP，X-RateLimit-Limit，X-RateLimit-Remaining，X-RateLimit-Reset，X-OAuth-Scopes，X-Accepted-OAuth-Scopes， X-轮询间隔
Access-Control-Max-Age：86400
JSON-P回调
您可以将?callback参数发送到任何GET调用，以将结果包装在JSON函数中。这通常在浏览器希望通过解决跨域问题在网页中嵌入GitHub内容时使用。响应包括与常规API相同的数据输出，以及相关的HTTP标头信息。

curl https://api.github.com?callback=foo 
/ ** / foo（{ 
  “meta”：{ 
    “status”：200，
    “X-RateLimit-Limit”：“5000”，
    “X-RateLimit-Remaining “：”4966“，
    ”X-RateLimit-Reset“：”1372700873“，
    ”链接“：[//分页标题和其他链接
      [”https://api.github.com?page=2“，{”rel “：”next“}] 
    ] 
  }，
  ”data“：{ 
    //数据
  } 
}）
您可以编写JavaScript处理程序来处理回调。这是您可以尝试的最小示例：

<html>
<head>
<script type="text/javascript">
function foo(response) {
  var meta = response.meta;
  var data = response.data;
  console.log(meta);
  console.log(data);
}

var script = document.createElement('script');
script.src = 'https://api.github.com?callback=foo';

document.getElementsByTagName('head')[0].appendChild(script);
</script>
</head>

<body>
  <p>Open up your browser's console.</p>
</body>
</html>
所有标头都与HTTP标头具有相同的字符串值，但有一个值得注意的例外：链接。链接头是为您预先解析的，并作为[url, options]元组数组来实现。

一个看起来像这样的链接：

Link: <url1>; rel="next", <url2>; rel="foo"; bar="baz"
...在Callback输出中将如下所示：

{
  "Link": [
    [
      "url1",
      {
        "rel": "next"
      }
    ],
    [
      "url2",
      {
        "rel": "foo",
        "bar": "baz"
      }
    ]
  ]
}
时区
某些创建新数据的请求（例如创建新提交）允许您在指定或生成时间戳时提供时区信息。我们按优先级顺序应用以下规则来确定API调用的时区信息。

明确提供带有时区信息的ISO 8601时间戳
使用Time-Zone标题
使用用户的最后已知时区
在没有其他时区信息的情况下默认为UTC
明确提供带有时区信息的ISO 8601时间戳
对于允许指定时间戳的API调用，我们使用该确切的时间戳。一个例子是Commits API。

这些时间戳看起来像2014-02-27T15:05:06+01:00。另请参阅此示例，了解如何指定这些时间戳。

使用Time-Zone标题
可以Time-Zone根据Olson数据库中的名称列表提供定义时区的标头。

卷曲-H“时区：欧洲/阿姆斯特丹”-X POST https://api.github.com/repos/github/linguist/contents/new_file.md
这意味着我们会在此标头定义的时区中生成API调用的时间戳。例如，Contents API为每次添加或更改生成git提交，并使用当前时间作为时间戳。此标头将确定用于生成当前时间戳的时区。

使用用户的最后已知时区
如果未Time-Zone指定标头并且您对API进行了经过身份验证的调用，则我们会对经过身份验证的用户使用上次已知的时区。每当您浏览GitHub网站时，最新的已知时区都会更新。

在没有其他时区信息的情况下默认为UTC
如果上述步骤不会产生任何信息，我们使用UTC作为时区来创建git提交。

