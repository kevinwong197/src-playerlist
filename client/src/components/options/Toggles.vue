<template>
  <div class="btn-group btn-group-toggle" data-toggle="buttons">
    <empty-button />
    <local-button />
  </div>  
</template>

<script>
import EmptyButton from '@/components/options/toggles/EmptyButton'
import LocalButton from '@/components/options/toggles/LocalButton'

export default {
  components: {
    EmptyButton,
    LocalButton
  }
}
</script>
