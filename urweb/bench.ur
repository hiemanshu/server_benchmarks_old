open Json

fun returnJson [a] (_ : json a) (j : a) : transaction page =
  returnBlob (textBlob (toJson j)) (blessMime "application/json")

fun returnText (t : string) : transaction page =
  returnBlob (textBlob t) (blessMime "text/plain")

table fortunes : {Id : int, Message : string} PRIMARY KEY Id

fun fortuneshtml () =
  fs <- queryL1 (SELECT Fortunes.Id, Fortunes.Message FROM fortunes);
  return <xml>
    <head><title>Fortunes</title></head>
    <body><table>
      {List.mapX (fn f => <xml><tr>
        <td>{[f.Id]}</td><td>{[f.Message]}</td>
      </tr></xml>) fs}
    </table></body>
  </xml>

type json_t = {Id: int, Message : string}
val json_conversion : json json_t = json_record {Id = "id", Message = "message"}

fun fortunesjson () =
  fs <- queryL1 (SELECT Fortunes.Id, Fortunes.Message FROM fortunes);
  returnJson fs

fun hello () =
  returnText "Hello, World!"
