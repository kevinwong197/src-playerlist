<template>
  <b-navbar class="text-left" toggleable="md" variant="primary" type="dark" sticky>
    <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
    <game-label />
    <b-collapse is-nav id="nav_collapse">
      <b-navbar-nav>
        <b-nav-item-dropdown text="Source" boundary="scrollParent" left>
          <div style="max-height: 50vh;overflow-y: scroll;overflow-x: hidden">
            <game-type name="Team Fortress 2" dirname="tf"/>
            <game-type name="Half-Life 2: Deathmatch" dirname="hl2mp"/>
            <game-type name="Counter-Strike: Source" dirname="cstrike"/>
            <game-type name="Counter-Strike: Global Offensive" dirname="CSGO"/>
            <game-type name="Garry's Mod" dirname="garrysmod"/>
            <game-type name="Left 4 Dead" dirname="left4dead"/>
            <game-type name="Left 4 Dead 2" dirname="left4dead2"/>
            <game-type name="Day of Defeat: Source" dirname="dod"/>
            <game-type name="Alien Swarm" dirname="swarm"/>
          </div>
        </b-nav-item-dropdown>
        <b-nav-item-dropdown text="Goldsrc" boundary="scrollParent" left>
          <div style="max-height: 50vh;overflow-y: scroll;overflow-x: hidden">
            <game-type name="Ricochet" dirname="ricochet"/>
            <game-type name="Team Fortress Classic" dirname="tfc"/>
            <game-type name="Deathmatch Classic" dirname="dmc"/>
            <game-type name="Sven Co-op" dirname="svencoop"/>
            <game-type name="Half-Life Deathmatch: Source" dirname="hl1mp"/>
          </div>
        </b-nav-item-dropdown>
        <b-nav-item-dropdown text="SourceMod" boundary="scrollParent" left>
          <div style="max-height: 50vh;overflow-y: scroll;overflow-x: hidden">
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
          </div>
        </b-nav-item-dropdown>
        <b-nav-item href="#" v-b-modal.options>Options</b-nav-item>
      </b-navbar-nav>

      <b-navbar-nav class="ml-auto">
        <b-nav-form>
          <b-input-group>
            <b-dropdown size="sm" text="Filters" boundary="scrollParent" right>
              <name-input size="sm" />
              <map-input size="sm" />
            </b-dropdown>
            <refresh-button size="sm" slot="append">Full Refresh</refresh-button>
          </b-input-group>
        </b-nav-form>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>

<script>
import MapInput from '@/components/navbar/MapInput'
import NameInput from '@/components/navbar/NameInput'
import RefreshButton from '@/components/navbar/RefreshButton'
import GameType from '@/components/navbar/GameType'
import GameLabel from '@/components/navbar/GameLabel'

export default {
  components: {
    MapInput,
    NameInput,
    RefreshButton,
    GameType,
    GameLabel
  }
}
</script>

<style scoped>
</style>