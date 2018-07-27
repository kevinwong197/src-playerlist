<template>
  <div>
    <options-modal />
    <navbar />
    <servers />
  </div>
</template>

<script>
import Servers from '@/components/Servers'
import Navbar from '@/components/Navbar'
import OptionsModal from '@/components/navbar/OptionsModal'


export default {
  components: {
    Servers,
    Navbar,
    OptionsModal
  }
}
</script>

<style scoped>
</style>
