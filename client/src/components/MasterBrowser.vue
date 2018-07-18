<template>
  <div class="container mb-2">
    <div class="row">
      <refresh-button class="col" />
    </div>
    <div class="row">
      <master-options class="col" />
    </div>
    <div class="row">
      <servers class="col" />
    </div>
    <div class="row">
      <players class="col" />
    </div>
  </div>
</template>

<script>
import RefreshButton from '@/components/RefreshButton'
import MasterOptions from '@/components/MasterOptions'
import ServerList from '@/components/Servers'
import PlayerList from '@/components/Players'

export default {
  components: {
    RefreshButton,
    MasterOptions,
    ServerList,
    PlayerList
  }
}
</script>

<style scoped>
</style>
