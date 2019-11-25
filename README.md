## Rails API app usig Pundit authorization

### Installation
- run `bundle`
- run `rails db:setup && rails db:seed`

Check the policies available for `Post`.
You can try to execute a `PATCH` request to `http://localhost:3000/posts/1` with the below JSON data:

```json
{
  "data": {
    "type": "posts",
    "id": "1",
    "attributes": {
      "body": "Some crazy text",
      "title": "new title"
    }
  }
}
```
and see the authorization in action.
