.class Lcom/instantlabs/instant/LoginActivity$4;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/LoginActivity;->login(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/LoginActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 90
    const-class v0, Lcom/instantlabs/instant/LoginActivity;

    return-void
.end method

.method constructor <init>(Lcom/instantlabs/instant/LoginActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/instantlabs/instant/LoginActivity$4;->this$0:Lcom/instantlabs/instant/LoginActivity;

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 1

    iget-object p1, p0, Lcom/instantlabs/instant/LoginActivity$4;->this$0:Lcom/instantlabs/instant/LoginActivity;

    .line 93
    new-instance v0, Lcom/instantlabs/instant/LoginActivity$4$1;

    invoke-direct {v0, p0, p2}, Lcom/instantlabs/instant/LoginActivity$4$1;-><init>(Lcom/instantlabs/instant/LoginActivity$4;Ljava/io/IOException;)V

    invoke-virtual {p1, v0}, Lcom/instantlabs/instant/LoginActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 106
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1

    .line 108
    :try_start_0
    invoke-static {p1}, Lcom/google/gson/JsonParser;->parseString(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object p1

    const-string p2, "Access-Token"

    .line 109
    invoke-virtual {p1, p2}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/instantlabs/instant/LoginActivity$4;->this$0:Lcom/instantlabs/instant/LoginActivity;

    .line 110
    invoke-static {p2, p1}, Lcom/instantlabs/instant/LoginActivity;->access$100(Lcom/instantlabs/instant/LoginActivity;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/instantlabs/instant/LoginActivity$4;->this$0:Lcom/instantlabs/instant/LoginActivity;

    .line 111
    invoke-static {p1}, Lcom/instantlabs/instant/LoginActivity;->access$200(Lcom/instantlabs/instant/LoginActivity;)V
    :try_end_0
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    iget-object p1, p0, Lcom/instantlabs/instant/LoginActivity$4;->this$0:Lcom/instantlabs/instant/LoginActivity;

    .line 113
    new-instance p2, Lcom/instantlabs/instant/LoginActivity$4$2;

    invoke-direct {p2, p0}, Lcom/instantlabs/instant/LoginActivity$4$2;-><init>(Lcom/instantlabs/instant/LoginActivity$4;)V

    invoke-virtual {p1, p2}, Lcom/instantlabs/instant/LoginActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/instantlabs/instant/LoginActivity$4;->this$0:Lcom/instantlabs/instant/LoginActivity;

    .line 121
    new-instance v0, Lcom/instantlabs/instant/LoginActivity$4$3;

    invoke-direct {v0, p0, p2}, Lcom/instantlabs/instant/LoginActivity$4$3;-><init>(Lcom/instantlabs/instant/LoginActivity$4;Lokhttp3/Response;)V

    invoke-virtual {p1, v0}, Lcom/instantlabs/instant/LoginActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
