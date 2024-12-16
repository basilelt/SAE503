package com.shweit.serverapi.webhooks.player;

import com.shweit.serverapi.MinecraftServerAPI;
import com.shweit.serverapi.webhooks.RegisterWebHooks;
import com.shweit.serverapi.webhooks.WebHook;
import com.shweit.serverapi.webhooks.WebHookEnum;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerItemBreakEvent;
import org.json.JSONObject;

public final class PlayerItemBreak implements WebHook, Listener {

    private final String eventName = WebHookEnum.PLAYER_ITEM_BREAK.label;

    @Override
    public void register() {
        if (RegisterWebHooks.doActivateWebhook(eventName)) {
            MinecraftServerAPI plugin = MinecraftServerAPI.getInstance();
            plugin.getServer().getPluginManager().registerEvents(this, plugin);
        }
    }

    @EventHandler
    public void onPlayerItemBreak(final PlayerItemBreakEvent event) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("event", eventName);
        jsonObject.put("player", event.getPlayer().getName());
        jsonObject.put("location", event.getPlayer().getLocation().toString());
        jsonObject.put("item", event.getBrokenItem().getType().name());

        RegisterWebHooks.sendToAllUrls(jsonObject);
    }
}