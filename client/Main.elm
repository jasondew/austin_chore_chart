import Childwork exposing (init, update, view)
import StartApp
import Task exposing (Task)
import Effects
import Signal
import Html exposing (Html)

app : {
  html : Signal Html,
  model : Signal Childwork.Model,
  tasks : Signal (Task Effects.Never ())
}
app =
  StartApp.start {
    init = init,
    update = update,
    view = view,
    inputs = []
  }

main : Signal Html
main =
  app.html

port tasks : Signal (Task Effects.Never ())
port tasks =
  app.tasks
