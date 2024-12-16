FROM gradle:8.11.1-jdk21

WORKDIR /app

COPY compile_paper_code.sh compile_velocity_code.sh /app/

RUN chmod +x /app/compile_paper_code.sh /app/compile_velocity_code.sh

ENTRYPOINT ["/bin/sh", "-c", "/app/compile_paper_code.sh && /app/compile_velocity_code.sh"]