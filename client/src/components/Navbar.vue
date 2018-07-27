<template>
  <b-navbar class="shadow text-left" toggleable="md" variant="primary" type="dark" sticky>
    <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
    <game-label />
    <b-collapse is-nav id="nav_collapse">
      <b-navbar-nav>
        <b-nav-item-dropdown text="Source" boundary="scrollParent" left>
          <game-type name="Team Fortress 2" dirname="tf"/>
          <game-type name="Half-Life 2: Deathmatch" dirname="hl2mp"/>
          <game-type name="Counter-Strike: Source" dirname="cstrike"/>
          <game-type name="Counter-Strike: Global Offensive" dirname="CSGO"/>
          <game-type name="Garry's Mod" dirname="garrysmod"/>
          <game-type name="Left 4 Dead" dirname="left4dead"/>
          <game-type name="Left 4 Dead 2" dirname="left4dead2"/>
          <game-type name="Day of Defeat: Source" dirname="dod"/>
          <game-type name="Alien Swarm" dirname="swarm"/>
        </b-nav-item-dropdown>
        <b-nav-item-dropdown text="Goldsrc" boundary="scrollParent" left>
          <game-type name="Ricochet" dirname="ricochet"/>
          <game-type name="Team Fortress Classic" dirname="tfc"/>
          <game-type name="Deathmatch Classic" dirname="dmc"/>
          <game-type name="Sven Co-op" dirname="svencoop"/>
          <game-type name="Half-Life Deathmatch: Source" dirname="hl1mp"/>
        </b-nav-item-dropdown>
        <b-nav-item-dropdown text="SourceMod" boundary="scrollParent" left>
          <game-type name="Black Mesa" dirname="bms"/>
          <game-type name="gmod9" dirname="gmod9"/>
          <game-type name="obsidian" dirname="obsidian"/>
          <game-type name="synergy" dirname="synergy"/>
          <game-type name="Contagion" dirname="contagion"/>
          <game-type name="Insurgency" dirname="insurgency"/>
          <game-type name="Zombie Panic! Source" dirname="zps"/>
          <game-type name="No More Room in Hell" dirname="nmrih"/>
          <game-type name="Fistful of Frags" dirname="fof"/>
          <game-type name="TF2Classic" dirname="tf2classic"/>
          <game-type name="Pirates, Vikings & Knights II" dirname="pvkii"/>
          <game-type name="Dino D-Day" dirname="dinodday"/>
          <game-type name="Codename CURE" dirname="cure"/>
        </b-nav-item-dropdown>
        <b-nav-item href="#" v-b-modal.options>Options</b-nav-item>
      </b-navbar-nav>

      <b-navbar-nav class="ml-auto">
        <b-nav-form>
          <b-input-group>
            <map-input size="sm" class=""/>
            <refresh-button size="sm" slot="append">Full Refresh</refresh-button>
          </b-input-group>
        </b-nav-form>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>

<script>
import MapInput from '@/components/navbar/MapInput'
import RefreshButton from '@/components/navbar/RefreshButton'
import GameType from '@/components/navbar/GameType'
import GameLabel from '@/components/navbar/GameLabel'

export default {
  components: {
    MapInput,
    RefreshButton,
    GameType,
    GameLabel
  }
}
</script>

<style scoped>
.shadow {
  box-shadow: 0 20px 60px rgba(10, 10, 10, 0.05), 0 5px 10px rgba(10, 10, 10, 0.1), 0 1px 1px rgba(10, 10, 10, 0.2);
}
.dropdown-menu {
  width: 100%;
}

.scrollable-menu {
  height: auto;
  max-height: 200px;
  overflow-x: hidden;
}
</style>