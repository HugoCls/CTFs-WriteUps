.class Lcom/instantlabs/instant/RegisterActivity$3;
.super Ljava/lang/Object;
.source "RegisterActivity.java"

# interfaces
.implements Lokhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/RegisterActivity;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/RegisterActivity;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 80
    const-class v0, Lcom/instantlabs/instant/RegisterActivity;

    return-void
.end method

.method constructor <init>(Lcom/instantlabs/instant/RegisterActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lokhttp3/Call;Ljava/io/IOException;)V
    .locals 1

    iget-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 83
    new-instance v0, Lcom/instantlabs/instant/RegisterActivity$3$1;

    invoke-direct {v0, p0, p2}, Lcom/instantlabs/instant/RegisterActivity$3$1;-><init>(Lcom/instantlabs/instant/RegisterActivity$3;Ljava/io/IOException;)V

    invoke-virtual {p1, v0}, Lcom/instantlabs/instant/RegisterActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResponse(Lokhttp3/Call;Lokhttp3/Response;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    invoke-virtual {p2}, Lokhttp3/Response;->isSuccessful()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 96
    invoke-virtual {p2}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object p1

    invoke-virtual {p1}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object p1

    .line 98
    :try_start_0
    invoke-static {p1}, Lcom/google/gson/JsonParser;->parseString(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->getAsJsonObject()Lcom/google/gson/JsonObject;

    move-result-object p1

    const-string p2, "Description"

    .line 99
    invoke-virtual {p1, p2}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    iget-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    const-string p2, "Your Account Has Been Registered!"

    const/4 v0, 0x1

    .line 100
    invoke-static {p1, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 102
    new-instance p1, Landroid/content/Intent;

    iget-object p2, p0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    const-class v0, Lcom/instantlabs/instant/LoginActivity;

    invoke-direct {p1, p2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object p2, p0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 103
    invoke-virtual {p2, p1}, Lcom/instantlabs/instant/RegisterActivity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 104
    invoke-virtual {p1}, Lcom/instantlabs/instant/RegisterActivity;->finish()V
    :try_end_0
    .catch Lcom/google/gson/JsonSyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    iget-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 106
    new-instance p2, Lcom/instantlabs/instant/RegisterActivity$3$2;

    invoke-direct {p2, p0}, Lcom/instantlabs/instant/RegisterActivity$3$2;-><init>(Lcom/instantlabs/instant/RegisterActivity$3;)V

    invoke-virtual {p1, p2}, Lcom/instantlabs/instant/RegisterActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$3;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 114
    new-instance v0, Lcom/instantlabs/instant/RegisterActivity$3$3;

    invoke-direct {v0, p0, p2}, Lcom/instantlabs/instant/RegisterActivity$3$3;-><init>(Lcom/instantlabs/instant/RegisterActivity$3;Lokhttp3/Response;)V

    invoke-virtual {p1, v0}, Lcom/instantlabs/instant/RegisterActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
