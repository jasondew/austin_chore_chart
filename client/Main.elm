import Childwork exposing (init, update, view)
import StartApp
import Task exposing (Task)
import Effects
import Signal

app =
  StartApp.start {
    init = init,
    update = update,
    view = view,
    inputs = []
  }

main =
  app.html

port tasks : Signal (Task Effects.Never ())
port tasks =
  app.tasks
