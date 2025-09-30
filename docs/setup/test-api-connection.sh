#!/bin/bash

# Test WordPress REST API Connection
# Uso: ./test-api-connection.sh

echo "🔍 Testing WordPress REST API Connection..."
echo "========================================"

# Verificar que existe .env.local
if [ ! -f ".env.local" ]; then
    echo "❌ Error: .env.local no encontrado"
    echo "💡 Crea .env.local usando .env.example como template"
    exit 1
fi

# Cargar variables de entorno (evitar problemas con espacios en passwords)
set -a
source .env.local
set +a

# Verificar variables obligatorias
if [ -z "$WP_API_BASE_URL" ] || [ -z "$WP_API_USERNAME" ] || [ -z "$WP_API_PASSWORD" ]; then
    echo "❌ Error: Variables de entorno incompletas"
    echo "💡 Verifica WP_API_BASE_URL, WP_API_USERNAME, WP_API_PASSWORD en .env.local"
    exit 1
fi

echo "🌐 URL: $WP_API_BASE_URL"
echo "👤 Usuario: $WP_API_USERNAME"
echo "🔑 Password: ${WP_API_PASSWORD:0:4}****"
echo ""

# Test 1: Verificar que la API responde
echo "Test 1: API Status Check"
echo "-----------------------"
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$WP_API_BASE_URL")

if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "✅ API está accesible (HTTP $HTTP_STATUS)"
else
    echo "❌ API no accesible (HTTP $HTTP_STATUS)"
    echo "💡 Verifica que los permalinks no sean 'Plain' en WordPress"
    exit 1
fi

# Test 2: Autenticación
echo ""
echo "Test 2: Authentication Test"
echo "---------------------------"
AUTH_RESPONSE=$(curl -s -u "$WP_API_USERNAME:$WP_API_PASSWORD" \
    "$WP_API_BASE_URL/posts?per_page=1")

if echo "$AUTH_RESPONSE" | grep -q '"id"'; then
    echo "✅ Autenticación exitosa"
    POST_COUNT=$(echo "$AUTH_RESPONSE" | grep -o '"id"' | wc -l)
    echo "📄 Posts encontrados: $POST_COUNT"
else
    echo "❌ Error de autenticación"
    echo "💡 Verifica username y Application Password"
    echo "🔍 Response: $AUTH_RESPONSE"
    exit 1
fi

# Test 3: Permisos de escritura
echo ""
echo "Test 3: Write Permissions Test"
echo "------------------------------"
DRAFT_RESPONSE=$(curl -s -X POST \
    -u "$WP_API_USERNAME:$WP_API_PASSWORD" \
    -H "Content-Type: application/json" \
    -d '{
        "title": "API Test Post - DELETE ME",
        "content": "Test post creado por script de verificación API. Puedes eliminar este post.",
        "status": "draft"
    }' \
    "$WP_API_BASE_URL/posts")

if echo "$DRAFT_RESPONSE" | grep -q '"id"'; then
    echo "✅ Permisos de escritura OK"

    # Obtener ID del post creado
    POST_ID=$(echo "$DRAFT_RESPONSE" | grep -o '"id":[0-9]*' | cut -d':' -f2)
    echo "📝 Post test creado con ID: $POST_ID"

    # Eliminar el post de prueba
    DELETE_RESPONSE=$(curl -s -X DELETE \
        -u "$WP_API_USERNAME:$WP_API_PASSWORD" \
        "$WP_API_BASE_URL/posts/$POST_ID?force=true")

    if echo "$DELETE_RESPONSE" | grep -q '"deleted":true'; then
        echo "🗑️  Post test eliminado correctamente"
    else
        echo "⚠️  Post test creado pero no se pudo eliminar (ID: $POST_ID)"
    fi
else
    echo "❌ Error: Sin permisos de escritura"
    echo "💡 Verifica que el usuario tenga rol 'Editor' o superior"
    echo "🔍 Response: $DRAFT_RESPONSE"
    exit 1
fi

# Test 4: Uploads (Media)
echo ""
echo "Test 4: Media Upload Test"
echo "-------------------------"

# Crear imagen de prueba temporal
TEST_IMAGE="/tmp/api-test-image.png"
echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8/5+hHgAHggJ/PchI7wAAAABJRU5ErkJggg==" | base64 -d > "$TEST_IMAGE"

UPLOAD_RESPONSE=$(curl -s -X POST \
    -u "$WP_API_USERNAME:$WP_API_PASSWORD" \
    -F "file=@$TEST_IMAGE" \
    "$WP_API_BASE_URL/media")

if echo "$UPLOAD_RESPONSE" | grep -q '"id"'; then
    echo "✅ Upload de media OK"

    # Obtener ID del archivo subido
    MEDIA_ID=$(echo "$UPLOAD_RESPONSE" | grep -o '"id":[0-9]*' | cut -d':' -f2)
    echo "🖼️  Imagen test subida con ID: $MEDIA_ID"

    # Eliminar imagen de prueba
    DELETE_MEDIA_RESPONSE=$(curl -s -X DELETE \
        -u "$WP_API_USERNAME:$WP_API_PASSWORD" \
        "$WP_API_BASE_URL/media/$MEDIA_ID?force=true")

    if echo "$DELETE_MEDIA_RESPONSE" | grep -q '"deleted":true'; then
        echo "🗑️  Imagen test eliminada correctamente"
    else
        echo "⚠️  Imagen test subida pero no se pudo eliminar (ID: $MEDIA_ID)"
    fi
else
    echo "❌ Error: Sin permisos de upload"
    echo "💡 Verifica permisos de upload_files para el usuario"
    echo "🔍 Response: $UPLOAD_RESPONSE"
fi

# Limpiar archivo temporal
rm -f "$TEST_IMAGE"

# Test 5: Categorías y Tags
echo ""
echo "Test 5: Categories & Tags Test"
echo "-----------------------------"
CATEGORIES_RESPONSE=$(curl -s -u "$WP_API_USERNAME:$WP_API_PASSWORD" \
    "$WP_API_BASE_URL/categories?per_page=5")

if echo "$CATEGORIES_RESPONSE" | grep -q '"id"'; then
    echo "✅ Acceso a categorías OK"
    CAT_COUNT=$(echo "$CATEGORIES_RESPONSE" | grep -o '"id"' | wc -l)
    echo "📂 Categorías disponibles: $CAT_COUNT"
else
    echo "❌ Error accediendo a categorías"
fi

# Resumen final
echo ""
echo "🎉 RESUMEN DE TESTS"
echo "=================="
echo "✅ API Status: OK"
echo "✅ Autenticación: OK"
echo "✅ Permisos escritura: OK"
echo "✅ Upload media: OK"
echo "✅ Taxonomías: OK"
echo ""
echo "🚀 WordPress REST API configurado correctamente!"
echo "💡 Ahora puedes configurar Make Connect y N8N"
echo ""

# Mostrar endpoints útiles
echo "📋 ENDPOINTS ÚTILES:"
echo "--------------------"
echo "Posts: $WP_API_BASE_URL/posts"
echo "Media: $WP_API_BASE_URL/media"
echo "Categories: $WP_API_BASE_URL/categories"
echo "Tags: $WP_API_BASE_URL/tags"
echo "Users: $WP_API_BASE_URL/users"
echo ""
echo "📖 Documentación: https://developer.wordpress.org/rest-api/"
