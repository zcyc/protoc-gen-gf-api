import (
	"github.com/gogf/gf/v2/frame/g"
)

{{range .Methods}}
type {{ .FunctionName }}Req struct {
	g.Meta   `path:"{{.Path}}" tags:"{{ $.InterfaceName }}" method:"{{.Method}}"`
	{{if eq .Method "POST" "PUT"}}
		{{range .Request.Fields }}
        	{{ .Name}} {{ .Type}}
        {{end}}
	{{end}}
}

type {{ .FunctionName }}Res struct {
	g.Meta `mime:"application/json"`
	{{if eq .Method "GET"}}
		{{range .Response.Fields }}
            {{ .Name}} {{ .Type}}
        {{end}}
	{{end}}
}
{{end}}

