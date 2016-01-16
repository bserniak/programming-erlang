%%%-------------------------------------------------------------------
%%% @author brian
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. Jan 2016 12:40 PM
%%%-------------------------------------------------------------------
-module(afile_client).
-author("brian").

%% API
-export([ls/1, get_file/2, put_file/3]).
ls(Server) ->
  Server ! {self(), list_dir},
  receive
    {Server, FileList} ->
      FileList
  end.

get_file(Server, File) ->
  Server ! {self(), {get_file, File}},
  receive
    {Server, Content} ->
      Content
  end.

put_file(Server, File, FileName) ->
  Server ! {self(), {put_file, File, FileName}}.

