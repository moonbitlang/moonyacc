## 0.3.41

- fix: fix parametric rules not working under json-cst mode

## 0.3.40

- feat: support `%start` with type, eg. `%start<Type> start_rule`

## 0.3.37

- feat: Print as mly without actions

## 0.3.23

- fix: fix bug in small_int_set which causes building incorrect lr1 automaton

## 0.3.18

- feat: allow header to be placed in the middle of declarations

## 0.3.14

- feat: support `rule: x=A | x=B { x }`

## 0.3.13

- feat: support using token image string as prec identifier

## 0.3.11

- feat: compatible with menhir's optional '|' and ';'

## 0.3.5

- feat: attach clause source code as comment of action

## 0.3.0

- feat: add support for parametric rules
- feat: add stdlib rules, and no-std cli option
