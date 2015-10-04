module Childwork where

import Html exposing (Html)
import Html.Attributes as Attributes exposing (id, class)
import Html.Events as Events exposing (onClick)
import Effects exposing (Effects)
import Signal exposing (Signal)
import Http
import Task
import Json.Decode as Json exposing ((:=))
import Date exposing (Date, Month(..))
import String
import Result

-- TYPES --

type alias Model =
  {
    completedChores: CompletedChores
  }

type alias Chore =
  {
    id: Int,
    name: String,
    rate: Int,
    notes: Maybe String
  }

type alias Chores = List Chore

type alias CompletedChore =
  {
    id: Int,
    chore: Chore,
    completedOn: Date,
    paidOn: Maybe Date
  }

type alias CompletedChores = List CompletedChore

type Action =
  Display (Maybe CompletedChores)
  | PayOut

-- INIT --

init : (Model, Effects Action)
init =
  (
    Model [],
    fetchState
  )

-- UPDATE --

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Display pair ->
      case pair of
        Just completedChores ->
          (Model completedChores, Effects.none)
        Nothing -> (Model [], Effects.none)
    PayOut ->
      (model, fetchState)

-- EFFECTS --

fetchState : Effects Action
fetchState =
  Http.get decodeState "/chores.json"
  |> Task.toMaybe
  |> Task.map Display
  |> Effects.task

decodeState : Json.Decoder CompletedChores
decodeState =
  let chore =
        Json.object4 Chore ("id" := Json.int)
                           ("name" := Json.string)
                           ("rate" := Json.int)
                           (Json.maybe ("notes" := Json.string))
      completedChore =
        Json.object4 CompletedChore ("id" := Json.int)
                                    ("chore" := chore)
                                    ("completed_on" := date)
                                    (Json.maybe ("paid_on" := date))
  in ("completed_chores" := Json.list completedChore)

date : Json.Decoder Date
date = Json.customDecoder Json.string Date.fromString

-- VIEW --

view : Signal.Address Action -> Model -> Html
view address model =
  Html.div [id "content", class "row"] [
    Html.div [class "col-md-4 col-md-offset-4"] [
      unpaidChoresTable address model.completedChores
    ]
  ]

unpaidChoresTable : Signal.Address Action -> CompletedChores -> Html
unpaidChoresTable address completedChores =
  let unpaidChores = List.filter unpaid completedChores
  in
    Html.div [class "panel panel-default panel-primary"] [
      Html.div [class "panel-heading"] [Html.text "Unpaid Chores"],
      Html.table [class "table table-striped table-responsive"] <| [
        Html.thead [] [
          Html.tr [] [
            Html.th [] [Html.text "Chore"],
            Html.th [] [Html.text "Rate"],
            Html.th [] [Html.text "Completed On"]
          ]
        ],
        Html.tbody []
        <| (completedChoreRows unpaidChores) ++ [totalRow address unpaidChores]
      ]
    ]

totalRow : Signal.Address Action -> CompletedChores -> Html
totalRow address completedChores =
  let total = List.sum <| List.map .rate <| List.map .chore completedChores
  in Html.tr [] [
       Html.th [] [Html.text "Total"],
       Html.td [class "text-right"] [Html.text <| formatMoney total],
       Html.td [] [Html.button [onClick address PayOut] [Html.text "Pay out"]]
     ]

unpaid : CompletedChore -> Bool
unpaid completedChore =
  case completedChore.paidOn of
    Just _  -> False
    Nothing -> True

completedChoreRows : CompletedChores -> List Html
completedChoreRows completedChores =
  List.map completedChoreRow
  <| List.sortBy (formatDate << .completedOn) completedChores

completedChoreRow : CompletedChore -> Html
completedChoreRow completedChore =
  Html.tr [Attributes.key <| toString completedChore.id] [
    Html.td [] [Html.text <| completedChore.chore.name],
    Html.td [class "text-right"] [Html.text <| formatMoney completedChore.chore.rate],
    Html.td [] [Html.text <| formatDate completedChore.completedOn]
  ]

formatMoney : Int -> String
formatMoney value =
  "$" ++ (toString value)

formatDate : Date -> String
formatDate date =
  let year  = Date.year date
      month = monthNumber <| Date.month date
      day   = Date.day date + 1
  in (toString year) ++ "-" ++
     (String.padLeft 2 '0' <| toString month) ++ "-" ++
     (String.padLeft 2 '0' <| toString day)

monthNumber : Date.Month -> Int
monthNumber month =
  case month of
    Jan -> 1
    Feb -> 2
    Mar -> 3
    Apr -> 4
    May -> 5
    Jun -> 6
    Jul -> 7
    Aug -> 8
    Sep -> 9
    Oct -> 10
    Nov -> 11
    Dec -> 12
