-module(mod_push_urbanairship).

-behavior(gen_mod).

-include("ejabberd.hrl").
-include("logger.hrl").

-export([start/2, stop/1]).

start(_Host, _Opts) ->
    ?INFO_MSG("mod_push_urbanairship is starting", []),
    ejabberd_hooks:add(pubsub_publish_item, Host, ?MODULE, on_push, 50),
    ok.

stop(_Host) ->
    ?INFO_MSG("mod_push_urbanairship is stopping", []),
    ejabberd_hooks:delete(pubsub_publish_item, Host, ?MODULE, on_push, 50),
    ok.

on_push(Server, Node, Publisher, JID, ItemId, Payload) ->
    ?DEBUG("Server: ~p", [Server]),
    ?DEBUG("Node: ~p", [Node]),
    ?DEBUG("Publisher: ~p", [Publisher]),
    ?DEBUG("JID: ~p", [JID]),
    ?DEBUG("Item ID: ~p", [ItemId]),
    ?DEBUG("Payload: ~p", [Payload]),
    ok.
