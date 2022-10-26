import (
	"github.com/gogf/gf/v2/frame/g"
)

{{range .Methods}}
type {{ .HandlerName }}Req struct {
	g.Meta   `path:"{{.Path}}" tags:"{{ $.InterfaceName }}" method:"{{.Method}}"`
	{{if eq .Method "POST" "PUT"}}
		*{{.Request}}
	{{end}}
}

type {{ .HandlerName }}Res struct {
	g.Meta `mime:"application/json"`
	{{if eq .Method "GET"}}
		*{{.Reply}}
	{{end}}
}
{{end}}

