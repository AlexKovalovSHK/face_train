import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
export default defineConfig({
  plugins: [react()],
  server: {
    watch:{
      usePolling:true
    },
    strictPort:true,
    host: true,
    port: 3004,
    open: true,
  }
})