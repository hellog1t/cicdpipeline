- name: Run tests
  run: npm test   # or pytest, go test, etc.
  
- name: Build and push Docker image
  uses: docker/build-push-action@v6
  with:
    context: .
    push: ${{ github.ref == 'refs/heads/main' }}
    tags: $$   {{ env.REGISTRY }}/   $${{ env.IMAGE_NAME }}:latest, $$   {{ env.REGISTRY }}/   $${{ env.IMAGE_NAME }}:${{ github.sha }}

   - name: Set up Docker Buildx
  uses: docker/setup-buildx-action@v3

# Then in build-push-action:
with:
  platforms: linux/amd64,linux/arm64
  push: true

  
  
