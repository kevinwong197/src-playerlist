<template>
  <div>
    <options-modal />
    <navbar />
    <servers />
  </div>
</template>

<script>
import RefreshButton from '@/components/RefreshButton'
import Servers from '@/components/Servers'
import Players from '@/components/Players'
import SimpleBar from '@/components/SimpleBar'
import Navbar from '@/components/Navbar'
import OptionsModal from '@/components/navbar/OptionsModal'


export default {
  components: {
    RefreshButton,
    Servers,
    Players,
    SimpleBar,
    Navbar,
    OptionsModal
  }
}
</script>

<style scoped>
</style>
