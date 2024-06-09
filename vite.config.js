import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  cors: false,
  server: {
    proxy: {
      '/api': 'http://localhost:8080',
      '/openapi': 'http://localhost:8080',
    },
  },
})
