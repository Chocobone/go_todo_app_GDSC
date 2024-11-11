package main

import (
	"context"
	"fmt"
	"log"
	"net"
	"os"

	"github.com/Chocobone/go_todo_app_GDSC/config"
)

func main() {
	// if len(os.Args) != 2 {
	// 	log.Printf("need port number\n")
	// 	os.Exit(1)
	// }
	// p := os.Args[1]
	// l, err := net.Listen("tcp", ":"+p)
	// if err != nil {
	// 	log.Fatalf("failed to listen port %s: %v", p, err)
	// }

	// // l.Addr() 메서드로 네트워크 연결의 주소를 가져옴
	// url := fmt.Sprintf("http://%s", l.Addr().String())

	// // 주소를 로그로 출력
	// log.Printf("start with: %v", url)

	// if err := run(context.Background(), l); err != nil {
	// 	log.Printf("Failed to terminate server: %v", err)
	// 	os.Exit(1)
	// }
	if err := run(context.Background()); err != nil {
		log.Printf("failed to terminate server: %v", err)
		os.Exit(1)
	}
}

func run(ctx context.Context) error {
	cfg, err := config.New()
	if err != nil {
		return err
	}
	l, err := net.Listen("tcp", fmt.Sprintf(":%d", cfg.Port))
	if err != nil {
		log.Fatalf("failed to listen port %d: %v", cfg.Port, err)
	}
	url := fmt.Sprintf("http://%s", l.Addr().String())
	log.Printf("start with: %v", url)
	mux := NewMux()
	s := NewServer(l, mux)
	return s.Run(ctx)

	// //page 62
	// ctx, stop := signal.NotifyContext(ctx, os.Interrupt, syscall.SIGTERM)
	// defer stop()

	// // page 59
	// cfg, err := config.New()
	// if err != nil {
	// 	return err
	// }
	// l, err := net.Listen("tcp", fmt.Sprintf(":%d", cfg.Port))
	// if err != nil {
	// 	log.Fatalf("failed to listen port %d: %v", cfg.Port, err)
	// }
	// url := fmt.Sprintf("http://%s", l.Addr().String())
	// log.Printf("start with: %v", url)

	// s := &http.Server{
	// 	Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
	// 		time.Sleep(5 * time.Second)
	// 		fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
	// 	}),
	// }

	// eg, ctx := errgroup.WithContext(ctx)

	// eg.Go(func() error {
	// 	if err := s.Serve(l); err != nil &&
	// 		err != http.ErrServerClosed {
	// 		log.Printf("Failed to close: %+v", err)
	// 		return err
	// 	}
	// 	return nil
	// })

	// <-ctx.Done()
	// if err := s.Shutdown(context.Background()); err != nil {
	// 	log.Printf("Failed to shutdown: %+v", err)
	// }
	// return eg.Wait()
}
