///|
pub fn elaborate(ast_spec : @parser.ParserSpec) -> ParserSpec {
  let header = ast_spec.header
  let trailer = ast_spec.trailer
  let decls = ast_spec.decls.map(fn(ast_decl) {
    match ast_decl {
      Start(symbols) => Start(symbols)
      Token(symbols, type_~) => Token(symbols, type_~)
      Token1(symbols, type_~, image~) => Token1(symbols, type_~, image~)
      Type(symbols, type_~) => Type(symbols, type_~)
      Derive(traits~, type_~) => Derive(traits~, type_~)
      Position(type_~) => Position(type_~)
      Left(symbols) => Left(symbols)
      Right(symbols) => Right(symbols)
      Nonassoc(symbols) => Nonassoc(symbols)
    }
  })
  fn map_item_ident(
    ast_item_ident : @parser.ClauseItemIdent
  ) -> ClauseItemIdent {
    match ast_item_ident {
      Dollar(x) => Dollar(x)
      Name(name) => Name(name)
    }
  }

  let rules = ast_spec.rules.map(fn(ast_rule) {
    let clauses = ast_rule.clauses.map(fn(ast_clause) {
      let items = ast_clause.items.map(fn(ast_item) {
        ClauseItem::{
          binder: ast_item.binder,
          symbol: match ast_item.symbol {
            Symbol(symbol) => Symbol(symbol)
            Image(symbol) => Image(symbol)
          },
        }
      })
      Clause::{
        items,
        prec: ast_clause.prec,
        action: ClauseAction::{
          code: match ast_clause.action.code {
            None => None
            Some(code) =>
              Some(CodeWithSubst::{
                code: code.code,
                utf8_pos: code.utf8_pos,
                subst: code.subst.map(fn(ast_subst) {
                  SubstItem::{
                    start: ast_subst.start,
                    end: ast_subst.end,
                    desc: match ast_subst.desc {
                      Dollar(x) => Dollar(x)
                      StartPos => StartPos
                      EndPos => EndPos
                      Loc => Loc
                      StartPosOf(x) => StartPosOf(map_item_ident(x))
                      EndPosOf(x) => EndPosOf(map_item_ident(x))
                      LocOf(x) => LocOf(map_item_ident(x))
                      SymbolStartPos => SymbolStartPos
                      Sloc => Sloc
                    },
                  }
                }),
              })
          },
          start: ast_clause.action.start,
          end: ast_clause.action.end,
        },
      }
    })
    Rule::{ nonterminal: ast_rule.nonterminal, type_: ast_rule.type_, clauses }
  })
  ParserSpec::{ header, decls, trailer, rules }
}
