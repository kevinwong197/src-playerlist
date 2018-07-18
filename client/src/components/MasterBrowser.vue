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
import MasterOptions from '@/components/Options'
import Servers from '@/components/Servers'
import Players from '@/components/Players'

export default {
  components: {
    RefreshButton,
    MasterOptions,
    Servers,
    Players
  }
}
</script>

<style scoped>
</style>
