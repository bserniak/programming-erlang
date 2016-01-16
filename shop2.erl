-module(shop2).
-export([total/1]).

cost(oranges) -> 5;
cost(newspaper) -> 8;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total(L) ->
  lists:sum(lists:map(fun({What, N}) -> shop:cost(What) * N end, L)).
