///|
test "nonassoc generates states with no remaining actions" {
  let grammar =
    #|%token<Int> NUMBER
    #|%token EQ EOF
    #|%nonassoc EQ
    #|%start<Int> start
    #|%type<Int> expr
    #|%%
    #|start: expr EQ EOF { $1 };
    #|expr: NUMBER { $1 } | expr EQ expr { $1 + $3 };
  for
    generator in [
      @gen_mbt.generator, @gen_mbt_table.generator, @gen_mbt_table.compress_generator,
    ] {
    ignore(@driver.compile(grammar, filename="nonassoc.mbty", generator~))
  }
}
