<template>
  <b-navbar style="width: 100%;" toggleable="md" type="dark" variant="info" sticky>  <!-- fixed="top" -->
    <b-navbar-toggle target="nav_collapse"></b-navbar-toggle>
    <b-collapse is-nav id="nav_collapse">
      <b-navbar-brand href="#">MasterBrowser</b-navbar-brand>
      <b-navbar-nav>
        <b-nav-item-dropdown text="Game" left>
          <b-dd-header>source</b-dd-header>
          <game-type name="Team Fortress 2" dirname="tf"/>
          <game-type name="Half-Life 2: Deathmatch" dirname="hl2mp"/>
          <game-type name="Counter-Strike: Source" dirname="cstrike"/>
          <game-type name="Counter-Strike: Global Offensive" dirname="CSGO"/>
          <game-type name="Garry's Mod" dirname="garrysmod"/>
          <game-type name="Left 4 Dead" dirname="left4dead"/>
          <game-type name="Left 4 Dead 2" dirname="left4dead2"/>
          <game-type name="Portal 2" dirname="portal2"/>
          <game-type name="Day of Defeat: Source" dirname="dod"/>
          <game-type name="Alien Swarm" dirname="swarm"/>
          <game-type name="Nuclear Dawn" dirname="nucleardawn"/>
          <b-dd-divider />
          <b-dd-header>goldsrc</b-dd-header>
          <game-type name="Ricochet" dirname="ricochet"/>
          <game-type name="Team Fortress Classic" dirname="tfc"/>
          <game-type name="Deathmatch Classic" dirname="dmc"/>
          <game-type name="Sven Co-op" dirname="svencoop"/>
          <game-type name="Half-Life Deathmatch: Source" dirname="hl1mp"/>
          <b-dd-divider />
          <b-dd-header>mod</b-dd-header>
          <game-type name="gmod9" dirname="gmod9"/>
          <game-type name="synergy" dirname="synergy"/>
          <game-type name="obsidian" dirname="obsidian"/>
          <game-type name="Contagion" dirname="contagion"/>
          <game-type name="Zombie Panic! Source" dirname="zps"/>
          <game-type name="Insurgency" dirname="insurgency"/>
          <game-type name="No More Room in Hell" dirname="nmrih"/>
          <game-type name="Fistful of Frags" dirname="fof"/>
          <game-type name="TF2 Classic" dirname="tf2classic"/>
          <game-type name="Black Mesa" dirname="bms"/>
          <game-type name="Age of Chivalry" dirname="ageofchivalry"/>
          <game-type name="D.I.P.R.I.P.: Warm Up" dirname="diprip"/>
          <game-type name="Dystopia" dirname="Dystopia"/>
          <game-type name="Pirates, Vikings & Knights II" dirname="pvkii"/>
          <game-type name="Smashball" dirname="Smashball"/>
          <game-type name="EYE" dirname="EYE"/>
          <game-type name="NEOTOKYO" dirname="NeotokyoSource"/>
          <game-type name="Dino D-Day" dirname="dinodday"/>
          <game-type name="thestanleyparable" dirname="thestanleyparable"/>
          <game-type name="Codename CURE" dirname="cure"/>
        </b-nav-item-dropdown>
        <b-nav-item href="#" v-b-modal.options>Options</b-nav-item>
      </b-navbar-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">
        <b-nav-form>
          <map-input size="sm" class="mr-sm-2" />
          <refresh-button size="sm" class="my-2 my-sm-0">Full Refresh</refresh-button>
        </b-nav-form>
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</template>

<script>
import MapInput from '@/components/navbar/MapInput'
import RefreshButton from '@/components/navbar/RefreshButton'
import GameType from '@/components/navbar/GameType'

export default {
  components: {
    MapInput,
    RefreshButton,
    GameType
  }
}
</script>